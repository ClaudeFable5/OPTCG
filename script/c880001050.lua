-- AUTO-GENERATED: OP08-074 / 블랙마리아
-- rules_id=OP08-074 script_id=880001050 fingerprint=23f44a018fc8b4034a0bc0c6efcebb92e8df6e0cb6a38bd84df5f0592b9e11bf
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-074]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            actions={
              {
                count=5,
                mode=[[UP_TO]],
                op=[[ADD_DON]],
                player=[[YOU]],
                state=[[RESTED]],
              },
            },
            conditions={
              {
                filter={},
                name=[[블랙마리아]],
                op=[[OTHER_CHARACTER_NAME_ABSENT]],
                player=[[YOU]],
              },
            },
            op=[[IF]],
          },
          {
            op=[[RETURN_DON_TO_MATCH_OPPONENT]],
            player=[[YOU]],
            schedule=[[THIS_TURN_END]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 캐릭터인 다른 「블랙마리아」가 없을 경우, 두웅!! 덱에서 두웅!!을 5장까지 레스트 상태로 추가한다. 그 후, 이번 턴 종료 시, 상대 필드의 두웅!! 수와 같은 수가 되도록 자신 필드의 두웅!!을 두웅!! 덱으로 되돌린다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-074]],
    schema_version=1,
  })
end
