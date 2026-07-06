-- AUTO-GENERATED: OP06-080 / 겟코 모리아
-- rules_id=OP06-080 script_id=880000814 fingerprint=e0b8455f207be5aa470197820b66e973023a10ed418caa69cb82a9bd1bea1724
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-080]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[MILL_DECK]],
            player=[[YOU]],
          },
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=4,
              trait=[[스릴러 바크 해적단]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_TRASH]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={
          {
            count=2,
            op=[[REST_DON]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】2(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다), 자신의 패 1장을 버릴 수 있다: 자신의 덱 위에서 2장을 트래시에 놓고, 자신의 트래시에서 코스트 4 이하인 《스릴러 바크 해적단》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-080]],
    schema_version=1,
  })
end
