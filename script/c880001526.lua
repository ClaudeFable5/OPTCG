-- AUTO-GENERATED: OP12-073 / 트라팔가 로
-- rules_id=OP12-073 script_id=880001526 fingerprint=060ddee0b7d88a8b4009daa7b1648e4b5a1402190a964321dadf99deaa268c45
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-073]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            player=[[YOU]],
            state=[[ACTIVE]],
          },
          {
            amount=1000,
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[MODIFY_POWER]],
            selector={
              count=0,
              filter={
                any={
                  {
                    name=[[돈키호테 로시난테]],
                  },
                  {
                    trait=[[하트 해적단]],
                  },
                },
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[FIELD_DON_LTE_OPPONENT]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신 필드의 두웅!!이 상대 필드의 두웅!! 수 이하인 경우, 두웅!! 덱에서 두웅!!을 1장까지 액티브 상태로 추가한다. 그 후, 다음 상대의 엔드 페이즈 종료 시까지, 자신의 「돈키호테 로시난테」와 《하트 해적단》 특징을 가진 모든 캐릭터의 파워 +1000.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-073]],
    schema_version=1,
  })
end
