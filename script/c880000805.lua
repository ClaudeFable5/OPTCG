-- AUTO-GENERATED: OP06-071 / 길드 테소로
-- rules_id=OP06-071 script_id=880000805 fingerprint=17d81cfebeece9fd6d698794da331b0a044e2222e2bc392660e694cdf295b86c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-071]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            destination=[[HAND]],
            filter={
              card_type=[[CHARACTER]],
              cost_lte=4,
              trait=[[FILM]],
            },
            mode=[[UP_TO]],
            op=[[ADD_FROM_TRASH]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[FILM]],
          },
        },
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】두웅!!-1(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 자신의 리더가 《FILM》 특징을 가진 경우, 자신의 트래시에서 《FILM》 특징을 가진 코스트 4 이하인 캐릭터 카드를 2장까지 패에 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-071]],
    schema_version=1,
  })
end
