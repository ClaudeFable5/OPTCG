-- AUTO-GENERATED: OP08-109 / 몽블랑 노랜드
-- rules_id=OP08-109 script_id=880001085 fingerprint=8df0f16f79dd8449012cb5d468d47d8373a497a33cdb32974f2fbbe47c36efd9
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-109]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_DECK_TOP]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[샨도라의 전사]],
          },
          {
            filter={
              name=[[카르가라]],
            },
            op=[[CHARACTER_EXISTS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《샨도라의 전사》 특징을 가지고, 자신의 캐릭터인 「카르가라」가 있을 경우, 자신의 덱 위에서 1장까지를 라이프 맨 위에 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-109]],
    schema_version=1,
  })
end
