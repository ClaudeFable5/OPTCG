-- AUTO-GENERATED: OP13-061 / 이누아라시
-- rules_id=OP13-061 script_id=880001633 fingerprint=859106ad5eb51041d705595628eea0bc70d06d8bac93f1c8106b6fe85180c87b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-061]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[RESTED]],
          },
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=1,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
            ["then"]=true,
          },
        },
        conditions={
          {
            count=1,
            op=[[ATTACHED_DON_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 부여되어 있는 두웅!!이 있을 경우, 두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다. 그 후, 상대의 코스트 1 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-061]],
    schema_version=1,
  })
end
