-- AUTO-GENERATED: OP07-085 / 스튜시
-- rules_id=OP07-085 script_id=880000940 fingerprint=8aad38306b924a2de3d5d2446ad4bdd3518de1dc3c0f8735f81be2c951004fb2
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-085]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_OWN_CARD]],
            selector={
              count=1,
              filter={
                card_type=[[CHARACTER]],
              },
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 캐릭터 1장을 트래시에 놓을 수 있다: 상대의 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-085]],
    schema_version=1,
  })
end
