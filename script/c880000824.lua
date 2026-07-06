-- AUTO-GENERATED: OP06-090 / Dr. 호그백
-- rules_id=OP06-090 script_id=880000824 fingerprint=d807642d81edf2d37fad8fe471b8d80940cef5898c0e46e4979b2af0bec4fe02
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-090]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            destination=[[HAND]],
            filter={
              name_neq=[[Dr. 호그백]],
              trait=[[스릴러 바크 해적단]],
            },
            mode=[[UP_TO]],
            op=[[ADD_FROM_TRASH]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=2,
            filter={},
            op=[[RETURN_TRASH_TO_DECK_BOTTOM]],
            order=[[CHOOSE]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 트래시에서 카드 2장을 원하는 순서대로 덱 맨 아래로 되돌릴 수 있다: 자신의 트래시에서 「Dr. 호그백」 이외의 《스릴러 바크 해적단》 특징을 가진 카드를 1장까지 패에 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-090]],
    schema_version=1,
  })
end
